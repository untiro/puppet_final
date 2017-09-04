Facter.add(:is_puppetmaster) do
  confine :kernel => 'Linux'
  setcode do
    a = Facter::Core::Execution.exec('cat /etc/motd')
    a.empty? ? 'false' : a
  end
end