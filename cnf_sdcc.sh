#! /bin/sh
perl -e '
$_ = "option-checking sdbinutils sdcpp device-lib z80-port";

$word{$_} = 1 foreach split;
print "./configure";
open(S, "configure") || die;
while (<S>) {
	if (/^enable_?(.*)_([^_=]+)\s/) {
		$_ = $1 eq "" ? "$2" : "$1-$2";
		print " --disable-$_" unless $word{$_};
	}
}
close S;
print "\n";
exit 0;
' | sh
