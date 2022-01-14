# frozen_string_literal: true

require 'mkmf'

$CFLAGS << " -O3 -Wall "
$CFLAGS << " -Wno-compound-token-split-by-macro"
create_makefile('repro/repro')
