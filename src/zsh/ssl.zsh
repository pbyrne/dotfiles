# Generate the MD5 checksum for SSL certificate files
#
# $ checkpem example.com.pem
# 0cd990ef1b1951837c4a3c12edc6ff10
# $ checkkey example.com.key
# 0cd990ef1b1951837c4a3c12edc6ff10
# $ checkcsr example.com.csr
# 0cd990ef1b1951837c4a3c12edc6ff10

function checkpem() {
  pemfile=$1
  openssl x509 -noout -modulus -in $pemfile | openssl md5
}

function checkkey() {
  keyfile=$1
  openssl rsa -noout -modulus -in $keyfile | openssl md5
}

function checkcsr() {
  csrfile=$1
  openssl req -noout -modulus -in $csrfile | openssl md5
}

# Ready the data from a .pem file
#
# $ readpem example.com.pem | grep "Not After"
# Not After : Mar 26 12:00:00 2015 GMT
function readpem() {
  pemfile=$1
  openssl x509 -in $pemfile -text -noout
}
