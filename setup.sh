curl -X POST 'https://api.cloudflare.com/client/v4/accounts/$ACCOUNTID/logpush/jobs' \
-H 'X-Auth-Key: $APIKEY' \
-H 'X-Auth-Email: $EMAIL' \
-H 'Content-Type: application/json' \
-d '{
  "name": "workers-logpush",
  "output_options": {
    "field_names": ["ClientIP", "EdgeStartTimestamp", "RayID", "Event", "EventTimestampMs", "Outcome", "Exceptions", "Logs", "ScriptName"],
    "sample_rate": 1.0,
    "timestamp_format": "unixnano",
    "output_type": "ndjson",
    "batch_prefix": "[",
    "batch_suffix": "]",
    "record_prefix": "{",
    "record_suffix": "}",
    "record_delimiter": ","
  },
  "filter": "{\"key\":\"ScriptName\",\"operator\":\"!eq\",\"value\":\"cloudflareaxioslogpush\"}",
  "destination_conf": "https://$SUBDOMAIN.workers.dev/log?header_Authorization=Bearer%20$TOKEN&header_content-type=application%2Fjson",,
  "dataset": "workers_trace_events",
  "enabled": true
}'
