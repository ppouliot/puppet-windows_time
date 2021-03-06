Facter.add(:w32tm_datetime_server_default) do
  confine :kernel => :windows
    setcode do
      require 'win32/registry'
        value = nil
        hive = Win32::Registry::HKEY_CLASSES_ROOT
        hive.open('HKLM\Software\Microsoft\Windows\CurrentVersion\DateTime\Servers',  Win32::Registry::KEY_READ | 0x100) do |reg|
        value = reg['(Default)']
      end
    value
  end
end
