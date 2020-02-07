#!/usr/bin/perl
use Tie::LevelDB; 

my $db = new Tie::LevelDB::DB("/tmp/testdb");
$db->Put("Google","Don't be evil!");
print $db->Get("Google")."\n";
$db->Delete("Google");

my $batch = new Tie::LevelDB::WriteBatch;
$batch->Delete("Google");
$batch->Put("Microsoft","Where Do you Want to Go Today?");
$db->Write($batch);

my $it = $db->NewIterator;
for($it->SeekToFirst;$it->Valid;$it->Next) {
   print $it->key.": ".$it->value."\n";
}

