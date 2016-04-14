Facter.add(:w32tm_ntpserver) do
  confine :kernel => :windows
    setcode do
      require 'win32/registry'
        value = nil
        hive = Win32::Registry::HKEY_CLASSES_ROOT
        hive.open('HKLM\System\CurrentControlSet\services\W32Time\Parameters',  Win32::Registry::KEY_READ | 0x100) do |reg|
        value = reg['NtpServer']
      end
    value
  end
end
