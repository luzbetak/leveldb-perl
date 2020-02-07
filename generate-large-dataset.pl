#!/usr/bin/perl
use Tie::LevelDB; 
use String::Random;

my $db = new Tie::LevelDB::DB("/tmp/leveldb100");
my $cnt = 1;

foreach(1..100_000_000) {

  my $key = get_random();
  my $val = get_random();
  $db->Put($key, $val);

  if(($cnt % 10000) == 0) {
    print($cnt . " " . $key . " " . $val . "\n");
  }
  $cnt++;
}

sub get_random {

  my $pass = new String::Random;
  return $pass->randpattern("cccccccccccc");

}
