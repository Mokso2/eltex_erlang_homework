
-record(ipv4,{
  version,
  ihl,
  tos,
  total_length,
  identification,
  flags,
  frag_offset,
  time_to_live,
  protocol,
  check_sum,
  source_address,
  destination_address,
  options_and_padding,
  data
}).