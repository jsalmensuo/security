# Storage and Transmission Order of Multi-Byte Values
The endian architecture defines the order in which **bytes** (a value made of 8 bits) are stored in memory and transmitted between systems.

When interpreting multiple bytes as a single value, like this hexadecimal 0x12345678 in standard internet protocols like TCP, UDP, IP, DNS, ICMP the most significant byte (MSB) is sent first, hence it is often called the Network Byte Order or Big-Endian (BE). Modern x86/86-64 CPUs however store the least significant byte (LSB) first. This approach is called Little-Endian.

## Comparison of Byte Orders

The Big-Endian order is more intuitive for human readability, as the hexadecimal value is transmitted from the most significant byte to the least significant byte:  
← 0x12 ← 0x34 ← 0x56 ← 0x78  
(Resulting in the sequence: 12345678)

Little-Endian transmits the bytes in a reversed sequence, starting with the least significant byte:  
← 0x78 ← 0x56 ← 0x34 ← 0x12   
(Resulting in the sequence: 78563412)

## Implementation and Conversions

To make this all work the software in CPU is responsible for the Endian conversion.
| Function  | Meaning                  | Description                                      |
|-----------|--------------------------|--------------------------------------------------|
| `htons()` | Host → Network Short     | Converts 16-bit integer to network byte order. |
| `htonl()` | Host → Network Long      | Converts 32-bit integer to network byte order. |
| `ntohs()` | Network → Host Short     | Converts 16-bit integer to host byte order.    |
| `ntohl()` | Network → Host Long      | Converts 32-bit integer to host byte order.    |



<br>Bi-Endian CPUs like the ARM Processor are capable handling both the LE and BE byte orders. To explore how these different byte orders affect memory storage and network transmission, you can use the provided tool, which demonstrates conversions between little-endian and big-endian values in practice.
