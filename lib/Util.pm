# -*- Mode: perl; indent-tabs-mode: nil -*-
#
# The contents of this file are subject to the Mozilla Public
# License Version 1.1 (the "License"); you may not use this file
# except in compliance with the License. You may obtain a copy of
# the License at http://www.mozilla.org/MPL/
#
# Software distributed under the License is distributed on an "AS
# IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
# implied. See the License for the specific language governing
# rights and limitations under the License.
#
# The Original Code is the Overall Browse Bugzilla Extension.
#
# The Initial Developer of the Original Code is "Nokia Corporation"
# Portions created by the Initial Developer are Copyright (C) 2011 the
# Initial Developer. All Rights Reserved.
#
# Contributor(s):
#   Eero Heino <eero.heino@nokia.com>

package Bugzilla::Extension::ListComponents::Util;
use strict;
use base qw(Exporter);
our @EXPORT = qw(
    show_all_components    
);

use Bugzilla::Util;

sub show_all_components {
    my ($vars, $VERSION) = @_;
    my $cgi = Bugzilla->cgi;

    my $user = $vars->{'user'};

    # This script does nothing but displaying mostly static data.
    Bugzilla->switch_to_shadow_db;

    my $classification_name = trim($cgi->param('classification') || '');
    my $classification = Bugzilla::Classification->check($classification_name);

    my @products = $user->get_selectable_products($classification->id);
    $vars->{'classifications'} = [{object => undef, products => @products}];
}
1;
