
class SeedData
  def initialize
    XlsAct.get_appllication_config
    $browser = XlsAct.get_appllication_config['Browsers']
    $application_name = XlsAct.get_appllication_config['ApplicationName']
    $login = XlsAct.xls_file_data_for_feature("#{$application_name}.xls",'login')
    binding.pry
  end
end