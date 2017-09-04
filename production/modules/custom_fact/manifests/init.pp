# custom fact class
class custom_fact {
  case $facts['is_puppetmaster'] {
    true:  {
      notify { ' This is puppetmaster ! ': }
    }
    false:  {
      notify { ' This is NOT puppetmaster ! ': }
    }
    default: {
      notify { "/etc/mots contains: ${facts}['is_puppetmaster'] ": }
    }
  }
}
