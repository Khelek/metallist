# encoding: utf-8

Configus.build Rails.env do
  credentials_hash = YAML.load(File.read("config/credentials.yml"))

  env :production do

    rails do
      secret_token credentials_hash["production"]["rails"]["secret_token"]
    end

    admin do
      login credentials_hash["production"]["admin"]["login"]
      password credentials_hash["production"]["admin"]["password"]
    end
  end

  env :development, parent: :production do
  end

  env :test, parent: :production do
  end
  
  env :staging, parent: :production do
  end

end
