#encoding: utf-8
config_file = File.join(Rails.root,"/config/baicheng.yml")
Rails.cache.write(:baicheng_location,YAML.load(File.open(config_file)))