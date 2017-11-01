powershell_script 'Install IIS' do
  code 'Add-WindowsFeature Web-Server'
end

file 'C:\inetpub\wwwroot\Default.htm' do
  content <<-EOH
    <h1>Hello World!</h1>
    <h2>PLATFORM: #{node['platform']}</h2>
    <h2>HOSTNAME: #{node['hostname']}</h2>
    <h2>MEMORY:   #{node['memory']['total']}</h2>
    <h2>CPU MHz:  #{node['cpu']['0']['mhz']}</h2>
    EOH
end

service 'w3svc' do
  action [ :enable, :start ]
end
