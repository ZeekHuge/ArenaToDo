/*
 * Copyright (c) 2016 Zubeen Tolani <ZeekHuge - zeekhuge@gmail.com>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 as published by
 * the Free Software Foundation.
 */
#include <stdio.h>
#include <curl/curl.h>

int main(void)
{
  CURL *curl;
  CURLcode res;

  curl = curl_easy_init();
  if(curl) {
    curl_easy_setopt(curl, CURLOPT_URL, "http://google.com");

    res = curl_easy_perform(curl);
    if(res != CURLE_OK)
      fprintf(stderr, "curl failed to perform: %s\n",
              curl_easy_strerror(res));

    curl_easy_cleanup(curl);
  }
  return 0;
}

