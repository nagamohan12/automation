class SeedData
  include DataMagic
  def initialize
    XlsAct.get_appllication_config
    $browser = XlsAct.get_browser
    $application_name = XlsAct.get_application_name
    # $login = XlsAct.xls_file_data_for_feature("#{$application_name}.xls",'login')
    $login = DataMagic.load 'test.yml'
    base_url = DataMagic.load "../../features/support/config.yml"
    $base_url = base_url["base_url"]
  end
end
