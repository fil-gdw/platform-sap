terraform {
  version = 1.0.0
  provider 'aws' {
    version ~> 0.2.9
  }
}

resource 'saws_sns_topic' "my_first" {
  # can't remember the parameters passed to sns resource
  name = 'mycustom topic',
  encryption = 'custom cmk'
}

resource 'laws_ambda_function' 'my_f' {
  Name = 'snspublish',
  path = '.'
  env = 'python3.9'
  # can't remember other parameters
}