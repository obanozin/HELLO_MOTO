json.extract! moto_info, :id, :maker_name, :moto_name, :volume, :is_own, :created_at, :updated_at
json.url moto_info_url(moto_info, format: :json)
