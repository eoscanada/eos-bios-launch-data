EOS BIOS Producer data
======================

This is the data repository for candidate Block Producers willing to
use [`eos-bios`](https://github.com/eoscanada/eos-bios) to bootstrap an
`EOS.IO Software` blockchain.

Propose your candidacy by submitting a PR to this repository, adding
your information to `launch.yaml`.

Be ready to run `eos-bios` when the time comes.

You'll need practice, so we'll be on the _EOS.IO Community Testnet_
channel on Telegram, rehearsing many times before launch.


Data about the candidate producers
----------------------------------

Here is the required data for candidate producers to use this software:

```
producers:
- account_name: eos.freezing
  authority:
    owner:
      threshold: 1
      keys:
      - public_key: EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
        weight: 1
    active:
      threshold: 1
      keys:
      - public_key: EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
        weight: 1
  initial_block_signing_key: EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
  keybase_user: frozenjack
  organization_name: EOS Antarctica
  timezone: Antarctica/South_Pole
  urls:
  - https://its.freezing.example.com
  - https://twitter/frozenjack
```

* `account_name`: the EOS Account name you want to boot the network with. It must follow the 12-characters limit and be composed of those characters only: `.12345abcdefghijklmnopqrstuvwxyz`. The BIOS Boot node will create that account and set it up for you.
* `authority` is the authorized you want the Boot Node to register for you, first thing. By providing a potentially multi-sig authority here, you can avoid bootstrapping your multi-sig strategy after chain launch.
* `initial_block_signing_key` is the key used to register the 21 Appointed Block Producers. It will not be used otherwise, but you must be ready to produce with this key if you are chosen in the 21 ABPs.
* `keybase_user` is used for PGP signing of kickstart data. It needs to be accessible by the person doing the boot sequence with the launch alliance. It is not needed after the boot process.
* `organization_name` is a friendly name for people to identify you.
* `timezone` is a standard Timezone spec (see https://en.wikipedia.org/wiki/List_of_tz_database_time_zones in the TZ column). Please select a non-deprecated time zone.  This is going to be used to help choose a good boot time and help locate geographically the producers.
* `urls` is a list of web properties owned by the organization. Those properties will be watched during the boot sequence, as a BIOS boot node would need to publish the _kickstart data_ to some (or all) of these properties.


