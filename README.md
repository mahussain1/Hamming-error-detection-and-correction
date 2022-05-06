# Hamming-error-detection-and-correction (Single bit)
Its an error detection and correction coding technique used to detect double and single bit errors when binary data is transmitted from one end to other. It is type for forward error correction coding which doesn't require re-transmission of data when received data is found to be corrupted. In this design, Hamming code for single bit error detection and correction is implemented using Verilog HDL.

There are four major keywords used in this design:
1. Codeword (**n**)
2. Redundant / Parity bits (**k**)
3. Dataword (**n-k**)
4. No. of correction bits (**t**)

In this design, (n,k,t) = (12,4,1) denoted as:
* Dataword = {m<sub>3</sub>, m<sub>5</sub>, m<sub>6</sub>, m<sub>7</sub>, m<sub>9</sub>, m<sub>10</sub>, m<sub>11</sub>, m<sub>12</sub>}
* Parity = {p<sub>1</sub>, p<sub>2</sub>, p<sub>4</sub>, p<sub>8</sub>}
* Codeword = {p<sub>1</sub>, p<sub>2</sub>, m<sub>3</sub>, p<sub>4</sub>, m<sub>5</sub>, m<sub>6</sub>, m<sub>7</sub>, p<sub>8</sub>, m<sub>9</sub>, m<sub>10</sub>, m<sub>11</sub>, m<sub>12</sub>}

## Encoder
At transmitting side, this module generates parity bits for encoding incoming data into the codeword. The dataword becomes unreadable when redundant bits are added to it. The parity bits are generated for every transmission of dataword. Each parity but is obtained by calculating exclusive or of those codeword bits having 2<sup>index</sup> position bit high for the 4-bit sequence of codeword where index = {0,1,2,3}.

In this way, 

p<sub>1</sub> = m<sub>3</sub> &and; m<sub>5</sub> &and; m<sub>7</sub> &and;  m<sub>9</sub>  &and; m<sub>10</sub>  &and; m<sub>11</sub>

p<sub>2</sub> =  m<sub>3</sub> &and; m<sub>6</sub> &and; m<sub>7</sub> &and;  m<sub>10</sub>  &and; m<sub>11</sub>

p<sub>3</sub> = m<sub>5</sub> &and; m<sub>6</sub> &and; m<sub>7</sub> &and; m<sub>12</sub>

p<sub>3</sub> = m<sub>9</sub>  &and; m<sub>10</sub>  &and; m<sub>11</sub>  &and; m<sub>12</sub>

## Decoder
This module is used to detect the position of bit in codeword which might be corrupted before reaching at receiving side. To locate that particular bit in the codeword sequence, it re-calculates the exclusive or of all databits in the same way as discussed above plus the parity bit w.r.t to parity number.

For finding Location **(C)** where,

C<sub>1</sub> = p<sub>1</sub> &and; m<sub>3</sub> &and; m<sub>5</sub> &and; m<sub>7</sub> &and; m<sub>9</sub> &and; m<sub>11</sub>

C<sub>2</sub> =  p<sub>2</sub> &and; m<sub>3</sub> &and; m<sub>6</sub> &and;  m<sub>7</sub>  &and; m<sub>10</sub> &and;  m<sub>11</sub>

C<sub>3</sub> = p<sub>3</sub> &and; m<sub>5</sub> &and; m<sub>6</sub> &and; m<sub>7</sub> &and; m<sub>12</sub>

C<sub>4</sub> = p<sub>4</sub> &and; m<sub>9</sub>  &and; m<sub>10</sub>  &and; m<sub>11</sub>  &and; m<sub>12</sub>

After that location bits are concatenated to obtain the single number as C = {C<sub>4</sub>, C<sub>3</sub>, C<sub>2</sub>, C<sub>1</sub> }.

## Correction
Upto now, we have located the position of corrupted bit. To correct that particular bit, simply corresponding bit is complemented.

## Simulation
The design have been simulated using **Vivado 2016.2**. From following waveforms, it is can be observed that design works very well to perform single bit error detection and correction.


<img src="./Images/encoding simulation graph.PNG">

*Encoding*

<img src="./Images/decoding simulation graph.PNG">

*Decoding and Correction*


Thank you for reading, Have a nice day :smiley:.
