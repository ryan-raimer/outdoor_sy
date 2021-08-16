# frozen_string_literal: true

require 'csv'

module DataImport
  class CustomerWithVehicleFileImportService
    AUTODETECTED_DELIMITERS = %w[| ,].freeze
    CUSTOMER_ATTRIBUTE_HASH_KEYS = %w[first_name last_name email].freeze
    VEHICLE_ATTRIBUTE_HASH_KEYS = %w[vehicle_type name length customer_id].freeze

    # File must be in the following format (with pipe, comma, or provided delimiters)
    # first|last|email|vehicle_type|vehcile_name|length
    #
    def import_file(file_path, delimiter = nil)
      CSV.open(file_path, headers: false, col_sep: delimiter || detect_separator(file_path)).each do |data_row|
        import_data_row(data_row)
      end
    rescue StandardError
      puts 'An error occured while importing the file.'
    end

    def detect_separator(file_path)
      csv_first_line = File.open(file_path).first
      AUTODETECTED_DELIMITERS.detect { |separator| csv_first_line.include?(separator) }
    end

    def import_data_row(data_row)
      customer = find_or_create_customer(data_row.first(3))
      find_or_create_vehicle(data_row.last(3) << customer.id)
    end

    def find_or_create_customer(customer_attribute_values)
      generate_object(Customer, CUSTOMER_ATTRIBUTE_HASH_KEYS, customer_attribute_values)
    end

    def find_or_create_vehicle(vehicle_attribute_values)
      generate_object(Vehicle, VEHICLE_ATTRIBUTE_HASH_KEYS, vehicle_attribute_values)
    end

    def generate_object(klass, attribute_keys, attribute_values)
      object_attributes = [attribute_keys, attribute_values].transpose.to_h
      klass.where(object_attributes).first_or_create
    end
  end
end
