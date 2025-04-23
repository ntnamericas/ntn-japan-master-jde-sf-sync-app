%dw 2.0
output application/json
---
payload 
    filter ((item, index) -> item.sfResponse != 1) 
    map (item) -> item - "sfResponse"
