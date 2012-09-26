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
(function(a,b){var c={ID:"tagCloud",Class:"tagCloud",Width:400,Heigth:400,Consistent:!0,Rank:30,Url:"#",FontMin:10,FontMax:24,Depth:150,AnimationTime:1,HoverStop:!0,OverWrite:!1},d=a,e=d.document,f=d.TagCloud,g=d.Tag,h=d.Vector,i=d.Surface,j=1,k=Object.prototype.toString,l="[object Object]",m=function(a){return k.call(a)===l},n=function(a){return!!a.nodeType},o=Math.PI/180,p=[],q=[],r=function(){var a=0,b=3600;while(a<b)p[a]=Math.sin(a/10*o),a++;return function(c){while(c<0)c+=360;return p[Math.round(c*10)%b]}}(),s=function(){var a=0,b=3600;while(a<b)q[a]=Math.cos(a/10*o),a++;return function(a){return q[Math.round(Math.abs(a)*10)%b]}}(),t={Add:function(){if(e.addEventListener)return function(a,b,c){return c=t.Fix.call(this,b==="mouseenter"||b==="mouseleave"?t.mouseEnter(c):c),b=b==="mouseenter"&&"mouseover"||b==="mouseleave"&&"mouseout"||b,a.addEventListener(b,c,!1),function(){return a.removeEventListener(b,c,!1),!0}};if(e.attachEvent)return function(a,b,c){return c=t.Fix.call(this,c),a.attachEvent("on"+b,c),function(){return a.detachEvent("on"+b,c),!0}}}(),Fix:function(a){return function(b){b.target||(b.target=b.srcElement||e),b.target.nodeType===3&&(b.target=b.target.parentNode),!b.relatedTarget&&b.fromElement&&(b.relatedTarget=b.fromElement===b.target?b.toElement:b.fromElement);if(b.pageX==null&&b.clientX!=null){var c=e.documentElement,d=e.body;b.pageX=b.clientX+(c&&c.scrollLeft||d&&d.scrollLeft||0)-(c&&c.clientLeft||d&&d.clientLeft||0),b.pageY=b.clientY+(c&&c.scrollTop||d&&d.scrollTop||0)-(c&&c.clientTop||d&&d.clientTop||0)}a.call(this,b)}},mouseEnter:function(a){var b=function(a,b){if(a===b)return!1;while(b&&b!==a)b=b.parentNode;return b===a};return function(c){var d=c.relatedTarget;if(this===d||b(this,d))return;a.call(this,c)}}},u=function(a,c,d){this.set=function(a,b,c){this.x=a||0,this.y=b||0,this.z=c||0},a!==b&&m(a)?this.set(a.x,a.y,a.z):this.set(a,c,d),this.Multiply=function(a){return this.x*=a,this.y*=a,this.z*=a,this},this.Done=function(){return Math.abs(this.x)>.01||Math.abs(this.y)>.01||Math.abs(this.z)>.01}},v=function(a,c){this.set=function(a,b){this.width=a||0,this.height=b||0},a!==b&&m(a)?this.set(a.width,a.height):this.set(a,c)},w=function(a,b,d){return this.id=b,this.className=d,this.active=!1,this.mouse=new u,this.position=new u,this.size=new v({width:a.size.width||c.Width/2,height:a.size.height||c.Heigth/2}),this.element=e.createElement("div"),this.element.setAttribute("id",this.id),this.element.setAttribute("class",this.className),this.element.style.width=this.size.width+"px",this.element.style.height=this.size.height+"px",this.element.style.display="block",this.Update=function(){return this.position=new u({x:this.element.offsetLeft,y:this.element.offsetTop}),this},this.Activate=function(){var b=this;return t.Add(this.element,"mousemove",function(d){return function(b){a.active||a.Animate();if(!c.HoverStop||!!this.active)this.Update(),this.mouse.set(((-b.pageY+this.position.y)*2/this.size.height+1)*1.8,((b.pageX-this.position.x)*2/this.size.width-1)*1.8)}.call(b,d)}),t.Add(this.element,"mouseenter",function(){b.active=!0}),t.Add(this.element,"mouseleave",function(){b.active=!1}),this},this},x=function(a,b,d){this.id=j++,this.title=a,this.rank=(!isNaN(b)&&b>=0&&b<=100?b:c.Rank)/100,this.url=d||(isNaN(b)?b:!1)||c.Url,this.position=new u;var f=e.createElement("a"),g=e.createElement("li");f.setAttribute("id","jsCumulus"+this.id),f.setAttribute("href",this.url),f.innerHTML=this.title,g.setAttribute("class","tagClass"),g.style.position="absolute",g.appendChild(f),this.element=g,g=f=null,this.Activate=function(a){return t.Add(this.element,"mouseenter",function(){a.active=!1}),t.Add(this.element,"mouseleave",function(){a.active=!0}),this}},y=function(a,f,g,h){n(arguments[0])&&(this.element=arguments[0],a=arguments[1],f=arguments[2],g=arguments[3],h=arguments[4]);var h=h||m(g)&&g||m(f)&&f||{};return this.active=!1,this.delta=new u(-2,-2),this.size=new v({width:parseFloat(!!parseFloat(f)&&f||!!parseFloat(h.width)&&h.width||c.Width),height:parseFloat(!!parseFloat(g)&&g||!!parseFloat(h.height)&&h.height||f||c.Height)}),this.font={min:parseFloat(h.fontMin)||c.FontMin,max:parseFloat(h.fontMax)||c.FontMax},this.radius=h.radius||Math.min(this.size.width,this.size.height)/4,this.consistent=h.consistent!==b?!!h.consistent:c.Consistent,this.overwrite=h.overwrite!==b?!!h.overwrite:c.OverWrite,this.items=a&&a.length&&a.slice(0)||function(){var a=50,b=0,c=[];for(;a>=b;--a)c[a]=new x("+",100);return c}(),this.attractor=new w(this,h.id||c.ID+Math.floor(Math.random()*1e4+1),h.className||c.Class),h=null,this.Distribute=function(a){var a=a||this.element||e.body,b=e.createElement("ul"),c=this.items.length-1,d=0,f;if(this.overwrite)while(a.firstChild)a.removeChild(a.firstChild);for(;c>=d;--c)f=this.items[c],f instanceof x&&f.title?(b.appendChild(f.element),f.Activate(this.attractor)):this.items.splice(c,1);this.attractor.element.appendChild(b),a.appendChild(this.attractor.element),this.attractor.Activate(),b=null;var g=0,h=0,i=this.items,c=0,j=i.length,k=this.radius;for(;c<j;c++)g=this.consistent?Math.acos(-1+2*c/j):Math.random()*Math.PI,h=this.consistent?Math.sqrt(j*Math.PI)*g:Math.random()*2*Math.PI,i[c].position.set(k*Math.sin(g)*Math.cos(h),k*Math.sin(g)*Math.sin(h),k*Math.cos(g));return g=h=i=c=j=k=null,this.Update(),this},this.Update=function(a){var b=this.items,d=this.attractor.Update(),a=a||new u,e=a.x||0,f=a.y||0,g=r(e),h=s(e),i=r(f),j=s(f),k=this.font.max-this.font.min,l=0,m=b.length;this.position=new u({x:this.size.width/2+d.position.x,y:this.size.height/2+d.position.y});for(;l<m;l++){var n=b[l],o=n.position,p=n.element,q=p.firstChild,t=o.x*j+(o.y*g+o.z*h)*i,v=o.y*h+o.z*-g,w=o.x*-i+(o.y*g+o.z*h)*j,x=c.Depth/(c.Depth+w);o.set(t,v,w),q.style.opacity=Math.max(x-.7,0)/.5+.2,q.style.fontSize=n.rank*x*k+this.font.min+"px",p.style.left=this.position.x+t*x-p.clientWidth/2+"px",p.style.top=this.position.y+v*x-p.clientHeight/2+"px"}return b=d=a=e=f=g=h=i=j=k=l=m=null,this},this.Pause=function(){return this.animation&&(this.active=!1,d.clearInterval(this.animation),this.animation=null),this},this.Stop=function(){return this.delta=new u,this.animation&&(this.active=!1,d.clearInterval(this.animation),this.animation=null),this},this.Animate=function(a){a&&this.Stop(),this.active=!0,this.delta=a||this.delta||new u;var b=this;return this.animation=d.setInterval(function(){return function(){this.attractor.active?this.delta=this.attractor.mouse:this.delta=this.delta.Multiply(.98),this.delta.Done()?this.Update(this.delta):this.Stop()}.call(b)},c.AnimationTime),this},this.element&&this.Distribute(this.element),this};d.JSCumulus=JSCumulus={},d.TagCloud=y,d.Tag=x,d.Vector=u,d.Surface=v,JSCumulus.noConflict=function(){d.TagCloud=f,d.JSCumulus.TagCloud=y,d.Tag=g,d.JSCumulus.Tag=x,d.Vector=h,d.JSCumulus.Vector=u,d.Surface=i,d.JSCumulus.Surface=v}})(window);