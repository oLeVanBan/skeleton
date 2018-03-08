## GET #index
Returns http success.

### Parameters
* `last_id` integer
* `limit` integer

### Example

#### Request
```
GET /api/v1/rooms?last_id=2&limit=20 HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Content-Length: 0
Host: www.example.com
X-Firebase-Token: GfTTObQhIp46D5pzakfk_ARJt0KdBiBQS6aeVIoyIykwLjAbxq6Td65PNmWyqqHP5w8gGoABW06kwY9YBYwLYJoQ
X-Token: de48fba55ce7a098eb52db20d5805027
X-User-Id: 3452312

{
  "last_id": "2",
  "limit": "20"
}
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Type: application/json; charset=utf-8

{
}
```
