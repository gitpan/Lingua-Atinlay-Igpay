package Lingua::Atinlay::Igpay;

use strict;
use warnings;

require Exporter;

use vars qw[@ISA %EXPORT_TAGS @EXPORT_OK $VERSION];
@ISA = qw(Exporter);

%EXPORT_TAGS = ( 'all' => [ qw[ enhay2igpayatinlay ] ] );

@EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

$VERSION = '0.01';

sub enhay2igpayatinlay(@) {
  my @list = @_;
  foreach ( @list ) {
    my @tokens = split /\b/;
    foreach ( @tokens ) {
      my $alluc   = ( $_ eq uc $_          ? 1 : 0 );
      my $firstuc = ( /^[A-Z]/ && ! $alluc ? 1 : 0 );
      if (    s/^([aeiou].*)/${1}hay/gsi
           || s/^([b-d,f-h,j-n,p-t,v-z]{2,})(.+)/${2}${1}ay/gsi
           || s/^([b-d,f-h,j-n,p-t,v-z])(.+)/${2}${1}ay/gsi ) {
                $_ = uc if $alluc;
                if ( $firstuc ) {
                  $_ = ucfirst;
                  s/((?:.h|.)ay)$/lc $1/e;
                }
      }
    }
    $_ = join '', @tokens;
  }
  return @list;
}

1;
__END__

=head1 AMENAY

Ingualay::Atinlayhay::Igpayhay - Erlpay Odulemay otay Onvertcay Englishhay otay Igpay Atinlay

=head1 OPSISSYNAY

  usehay Ingualay::Atinlayhay::Igpayhay wqay[:allhay]; # ortershay anthay enhay2igpayatinlayhay()

=head1 ESCRIPTIONDAY

=head2 enhay2igpayatinlayhay( ISTLAY )

Onvertcay Englishhay otay Igpay Atinlay

=head1 AUTHORHAY

Aseycay Estway <F<aseycay@eeknestgay.omcay>>

=head1 OPYRIGHTCAY

Opyrightcay (c) 2002 Aseycay R. Estway <aseycay@eeknestgay.omcay>.  Allhay
ightsray eservedray.  Isthay ogrampray ishay eefray oftwaresay; ouyay ancay
edistributeray ithay andhay/orhay odifymay ithay underhay ethay amesay ermstay ashay
Erlpay itselfhay.

=head1 EESAY ALSOHAY

erlpay(1).

=cut
