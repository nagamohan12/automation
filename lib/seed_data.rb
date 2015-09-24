class SeedData
  include DataMagic
  def initialize
    XlsAct.get_appllication_config
    $browser = XlsAct.get_browser
    $application_name = XlsAct.get_application_name
    # $login = XlsAct.xls_file_data_for_feature("#{$application_name}.xls",'login')

    # Yaml Inputs
    $yaml_test_data = DataMagic.load 'test_data.yml'

    # BAse URL
    base_url = DataMagic.load "../../features/support/config.yml"
    $base_url = base_url["base_url"]

    # json input
    json_path = "#{Record.present_directory_path}/config/data"
    test_data = File.read("#{json_path}/test_data.json")
    test = File.read("#{json_path}/test.json")
    $json_test_data = JSON.parse(test_data)
    $json_data_driven = JSON.parse(test)
  end
end
