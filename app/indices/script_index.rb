ThinkingSphinx::Index.define :script, :with => :active_record, :delta => ThinkingSphinx::Deltas::DelayedDelta do

	# fields
	indexes localized_names.attribute_value, :as => 'name'
	indexes localized_descriptions.attribute_value, :as => 'description'
	indexes localized_additional_infos.attribute_value, :as => 'additional_info'

	indexes user.name, :as => :author

	# attributes
	has :id, :created_at, :code_updated_at, :total_installs, :daily_installs, :default_name
	# int is default and unsigned, we deal with negatives
	has :fan_score, :type => :bigint

	where 'script_type_id = 1 and script_delete_type_id is null and !uses_disallowed_external'

	set_property :field_weights => {
		:name => 10,
		:author => 5,
		:description => 2,
		:additional_info => 1
	}

end
