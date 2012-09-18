/*\
JS-Cumulus - WP-Cumulus in JavaScript (codenamed jscumulus)
Based on Stratus plugin by Dawid Fatyga (fatyga@student.agh.edu.pl)
Based on WP-Cumulus by Roy Tanck (http://www.roytanck.com)

@author Jeroen van Warmerdam (aka jerone or jeronevw) (http://www.jeroenvanwarmerdam.nl)
@date 05-02-2010 14:00:00
@version 0.2.1

Copyright 2010, Jeroen van Warmerdam

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
\*/
/*\
*	TODO:
*		IDEA: Mouse panning, zooming;
*		ADD: Documentation;
*		ADD: Z-sorting;
*		ADD: Slow down more on tag mouse focus;
*		ADD: Calculating the color instead using the Opacity property;
*		ADD: Tags from xml;
\*/
/*\
*	TagCloud arguments:
*		element	=> Element			=> Element to append TagCloud (optional)(default: document.body);
*		tags	=> Array [Tag,...]	=> List of tags (mandatory);
*		width	=> Float			=> Width of container (optional)(default: 400);
*		height	=> Float			=> Height of container (optional)(default: same as width);
*		options	=> Object			=> Extra settings (optional);
*			id			=> String		=> Id of the wrapper (optional)(default: "tagCloud1234");
*			className	=> String		=> Class of the wrapper (optional)(default: "tagCloud");
*			consistent	=> Boolean		=> Devide tags evenly (optional)(default: true);
*			radius		=> Float		=> Radius (optional)(default: Math.min(width, height) / 4);
*			fontMin		=> Float		=> Font size for smallest tag in pixels (optional)(default: 10);
*			fontMax		=> Float		=> Font size for biggest tag in pixels (optional)(default: 24);
*			overwrite	=> Boolean		=> Override any existing HTML in the element (optional)(default: false);
*
*	TagCloud functions:
*		Distribute	=> Function	=> Will distribute tags in tagcloud on page (optional if element in TagCloud function is defined);
*			element	=> Element	=> Element to append TagCloud, will override argument from TagCloud function (optional)(default: document.body);
*		Animate		=> Function	=> Will animate the tagcloud (mandatory);
*			delta	=> Vector	=> 
*		Pause		=> Function	=> Will temporary pause the animation, to resume use Animate function (optional);
*		Stop		=> Function	=> Will immediately stop the animation, to start use Animate function (optional);
*		Update		=> Function	=> 
*
*	Tag arguments:
*		title	=> String			=> Title of the tag;
*		rank	=> Integer 0-100	=> Importance of the tag (optional)(default: 30);
*		url		=> String			=> Link of the tag (optional)(default "#");
\*/
(function(e,t){var n={ID:"tagCloud",Class:"tagCloud",Width:400,Heigth:400,Consistent:!0,Rank:30,Url:"#",FontMin:10,FontMax:24,Depth:150,AnimationTime:1,HoverStop:!0,OverWrite:!1},r=e,i=r.document,s=r.TagCloud,o=r.Tag,u=r.Vector,a=r.Surface,f=1,l=Object.prototype.toString,c="[object Object]",h=function(e){return l.call(e)===c},p=function(e){return!!e.nodeType},d=Math.PI/180,v=[],m=[],g=function(){var e=0,t=3600;while(e<t)v[e]=Math.sin(e/10*d),e++;return function(n){while(n<0)n+=360;return v[Math.round(n*10)%t]}}(),y=function(){var e=0,t=3600;while(e<t)m[e]=Math.cos(e/10*d),e++;return function(e){return m[Math.round(Math.abs(e)*10)%t]}}(),b={Add:function(){if(i.addEventListener)return function(e,t,n){return n=b.Fix.call(this,t==="mouseenter"||t==="mouseleave"?b.mouseEnter(n):n),t=t==="mouseenter"&&"mouseover"||t==="mouseleave"&&"mouseout"||t,e.addEventListener(t,n,!1),function(){return e.removeEventListener(t,n,!1),!0}};if(i.attachEvent)return function(e,t,n){return n=b.Fix.call(this,n),e.attachEvent("on"+t,n),function(){return e.detachEvent("on"+t,n),!0}}}(),Fix:function(e){return function(t){t.target||(t.target=t.srcElement||i),t.target.nodeType===3&&(t.target=t.target.parentNode),!t.relatedTarget&&t.fromElement&&(t.relatedTarget=t.fromElement===t.target?t.toElement:t.fromElement);if(t.pageX==null&&t.clientX!=null){var n=i.documentElement,r=i.body;t.pageX=t.clientX+(n&&n.scrollLeft||r&&r.scrollLeft||0)-(n&&n.clientLeft||r&&r.clientLeft||0),t.pageY=t.clientY+(n&&n.scrollTop||r&&r.scrollTop||0)-(n&&n.clientTop||r&&r.clientTop||0)}e.call(this,t)}},mouseEnter:function(e){var t=function(e,t){if(e===t)return!1;while(t&&t!==e)t=t.parentNode;return t===e};return function(n){var r=n.relatedTarget;if(this===r||t(this,r))return;e.call(this,n)}}},w=function(e,n,r){this.set=function(e,t,n){this.x=e||0,this.y=t||0,this.z=n||0},e!==t&&h(e)?this.set(e.x,e.y,e.z):this.set(e,n,r),this.Multiply=function(e){return this.x*=e,this.y*=e,this.z*=e,this},this.Done=function(){return Math.abs(this.x)>.01||Math.abs(this.y)>.01||Math.abs(this.z)>.01}},E=function(e,n){this.set=function(e,t){this.width=e||0,this.height=t||0},e!==t&&h(e)?this.set(e.width,e.height):this.set(e,n)},S=function(e,t,r){return this.id=t,this.className=r,this.active=!1,this.mouse=new w,this.position=new w,this.size=new E({width:e.size.width||n.Width/2,height:e.size.height||n.Heigth/2}),this.element=i.createElement("div"),this.element.setAttribute("id",this.id),this.element.setAttribute("class",this.className),this.element.style.width=this.size.width+"px",this.element.style.height=this.size.height+"px",this.element.style.display="block",this.Update=function(){return this.position=new w({x:this.element.offsetLeft,y:this.element.offsetTop}),this},this.Activate=function(){var t=this;return b.Add(this.element,"mousemove",function(r){return function(t){e.active||e.Animate();if(!n.HoverStop||!!this.active)this.Update(),this.mouse.set(((-t.pageY+this.position.y)*2/this.size.height+1)*1.8,((t.pageX-this.position.x)*2/this.size.width-1)*1.8)}.call(t,r)}),b.Add(this.element,"mouseenter",function(){t.active=!0}),b.Add(this.element,"mouseleave",function(){t.active=!1}),this},this},x=function(e,t,r){this.id=f++,this.title=e,this.rank=(!isNaN(t)&&t>=0&&t<=100?t:n.Rank)/100,this.url=r||(isNaN(t)?t:!1)||n.Url,this.position=new w;var s=i.createElement("a"),o=i.createElement("li");s.setAttribute("id","jsCumulus"+this.id),s.setAttribute("href",this.url),s.innerHTML=this.title,o.setAttribute("class","tagClass"),o.style.position="absolute",o.appendChild(s),this.element=o,o=s=null,this.Activate=function(e){return b.Add(this.element,"mouseenter",function(){e.active=!1}),b.Add(this.element,"mouseleave",function(){e.active=!0}),this}},T=function(e,s,o,u){p(arguments[0])&&(this.element=arguments[0],e=arguments[1],s=arguments[2],o=arguments[3],u=arguments[4]);var u=u||h(o)&&o||h(s)&&s||{};return this.active=!1,this.delta=new w(-2,-2),this.size=new E({width:parseFloat(!!parseFloat(s)&&s||!!parseFloat(u.width)&&u.width||n.Width),height:parseFloat(!!parseFloat(o)&&o||!!parseFloat(u.height)&&u.height||s||n.Height)}),this.font={min:parseFloat(u.fontMin)||n.FontMin,max:parseFloat(u.fontMax)||n.FontMax},this.radius=u.radius||Math.min(this.size.width,this.size.height)/4,this.consistent=u.consistent!==t?!!u.consistent:n.Consistent,this.overwrite=u.overwrite!==t?!!u.overwrite:n.OverWrite,this.items=e&&e.length&&e.slice(0)||function(){var e=50,t=0,n=[];for(;e>=t;--e)n[e]=new x("+",100);return n}(),this.attractor=new S(this,u.id||n.ID+Math.floor(Math.random()*1e4+1),u.className||n.Class),u=null,this.Distribute=function(e){var e=e||this.element||i.body,t=i.createElement("ul"),n=this.items.length-1,r=0,s;if(this.overwrite)while(e.firstChild)e.removeChild(e.firstChild);for(;n>=r;--n)s=this.items[n],s instanceof x&&s.title?(t.appendChild(s.element),s.Activate(this.attractor)):this.items.splice(n,1);this.attractor.element.appendChild(t),e.appendChild(this.attractor.element),this.attractor.Activate(),t=null;var o=0,u=0,a=this.items,n=0,f=a.length,l=this.radius;for(;n<f;n++)o=this.consistent?Math.acos(-1+2*n/f):Math.random()*Math.PI,u=this.consistent?Math.sqrt(f*Math.PI)*o:Math.random()*2*Math.PI,a[n].position.set(l*Math.sin(o)*Math.cos(u),l*Math.sin(o)*Math.sin(u),l*Math.cos(o));return o=u=a=n=f=l=null,this.Update(),this},this.Update=function(e){var t=this.items,r=this.attractor.Update(),e=e||new w,i=e.x||0,s=e.y||0,o=g(i),u=y(i),a=g(s),f=y(s),l=this.font.max-this.font.min,c=0,h=t.length;this.position=new w({x:this.size.width/2+r.position.x,y:this.size.height/2+r.position.y});for(;c<h;c++){var p=t[c],d=p.position,v=p.element,m=v.firstChild,b=d.x*f+(d.y*o+d.z*u)*a,E=d.y*u+d.z*-o,S=d.x*-a+(d.y*o+d.z*u)*f,x=n.Depth/(n.Depth+S);d.set(b,E,S),m.style.opacity=Math.max(x-.7,0)/.5+.2,m.style.fontSize=p.rank*x*l+this.font.min+"px",v.style.left=this.position.x+b*x-v.clientWidth/2+"px",v.style.top=this.position.y+E*x-v.clientHeight/2+"px"}return t=r=e=i=s=o=u=a=f=l=c=h=null,this},this.Pause=function(){return this.animation&&(this.active=!1,r.clearInterval(this.animation),this.animation=null),this},this.Stop=function(){return this.delta=new w,this.animation&&(this.active=!1,r.clearInterval(this.animation),this.animation=null),this},this.Animate=function(e){e&&this.Stop(),this.active=!0,this.delta=e||this.delta||new w;var t=this;return this.animation=r.setInterval(function(){return function(){this.attractor.active?this.delta=this.attractor.mouse:this.delta=this.delta.Multiply(.98),this.delta.Done()?this.Update(this.delta):this.Stop()}.call(t)},n.AnimationTime),this},this.element&&this.Distribute(this.element),this};r.JSCumulus=JSCumulus={},r.TagCloud=T,r.Tag=x,r.Vector=w,r.Surface=E,JSCumulus.noConflict=function(){r.TagCloud=s,r.JSCumulus.TagCloud=T,r.Tag=o,r.JSCumulus.Tag=x,r.Vector=u,r.JSCumulus.Vector=w,r.Surface=a,r.JSCumulus.Surface=E}})(window);