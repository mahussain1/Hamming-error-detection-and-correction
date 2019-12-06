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

Each parity but is obtained by calculating exclusive or of those codeword bits having 2<sup>index</sup> position bit high for the 4-bit sequence of codeword where index = {0,1,2,3}.

In this way, 
p<sub>1</sub> = $m<sub>3</sub> &and; m<sub>5</sub>$ &and; m<sub>6</sub> &and; m<sub>7</sub> &and;  m<sub>9</sub>  &and; m<sub>10</sub>  &and; m<sub>11</sub>  &and; m<sub>12</sub>
p<sub>2</sub> =  $ m<sub>3</sub> &and; m<sub>5</sub> &and; m<sub>7</sub> &and;  m<sub>9</sub>  &and; m<sub>11</sub> $
p<sub>3</sub> = $ m<sub>5</sub> &and; m<sub>6</sub> &and; m<sub>7</sub> &and; m<sub>12</sub> $
p<sub>3</sub> = $ m<sub>9</sub>  &and; m<sub>10</sub>  &and; m<sub>11</sub>  &and; m<sub>12</sub> $
