#!/usr/bin/php
<?php

$temp = array();

function match_landing($the_param) {
  preg_match('@^(?:http://)?([^/]+)@i', $the_param, $domain);
  $landing='/landing1.some-company.net/';
  return preg_match($landing, $the_param, $domain[1]);
}

// Extend stream timeout to 24 hours
stream_set_timeout(STDIN, 86400);

while ( $input = fgets(STDIN) ) {
  // Split the output (space delimited) from squid into an array.
  $temp = split(' ', $input);

  // Set the URL from squid to a temporary holder.
  $output = $temp[0] . "\n";

  // Check the URL for requests other than default landing page
  if ( !match_landing($temp[0]) ) {
    $output = "302:http://landing1.some-company.net/\n";
  }

  echo $output;
}
?>
