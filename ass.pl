use strict;
use warnings;

my %code = (
	'(ADC) \$(\w{2})' => '65',   # zero page
	'(ADC) \#\$(\w{2})' => '69', # immediate
	'(ADC) \$(\w{2})(\w{2})' => '6D', # absolute
	'ASL' => '0A',
	'BRK' => '00',
	'CLC' => '18',
	'CLD' => 'D8',
	'CLI' => '58',
	'CLV' => 'B8',
	'DEX' => 'CA',
	'DEY' => '88',
	'INX' => 'E8',
	'INY' => 'C8',
	'LSR' => '4A',
	'NOP' => 'EA',
	'PHA' => '48',
	'PHP' => '08',
	'PLA' => '68',
	'PLP' => '28',
	'ROL' => '2A',
	'ROR' => '6A',
	'RTI' => '40',
	'RTS' => '60',
	'SEC' => '38',
	'SED' => 'F8',
	'SEI' => '78',
	'STA \$\w{2}' => '85',
	'STA \$\w{4}' => '8D',
	'TAX' => 'AA',
	'TAY' => 'A8',
	'TSX' => 'BA',
	'TXA' => '8A',
	'TXS' => '9A',
	'TYA' => '98',
	
);

while (my $line = <DATA>) {
	foreach my $pat (keys %code) {
		if ($line =~ /^$pat\s.+/) {
			my $hex = $code{$pat};
			if (defined $3) {
				print "$hex $3 $2\n"
			} elsif (defined $2) {
				print "$hex $2\n";
			} elsif (defined $1) {
				print "$hex\n";
			}
		}
	}
}

__END__

ADC $00    A from zero
ADC #$01   A immediate
ADC $0300  A from $300