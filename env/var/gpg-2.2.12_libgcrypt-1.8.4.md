gpg (GnuPG) 2.2.12  
libgcrypt 1.8.4  
  
Supported algorithms:  
Pubkey: RSA, ELG, DSA, ECDH, ECDSA, EDDSA  
Cipher: IDEA, 3DES, CAST5, BLOWFISH, AES, AES192, AES256, TWOFISH, CAMELLIA128, CAMELLIA192, CAMELLIA256  
Hash: SHA1, RIPEMD160, SHA256, SHA384, SHA512, SHA224  
Compression: Uncompressed, ZIP, ZLIB, BZIP2  
  
License GPLv3+: GNU GPL version 3 or later <https://gnu.org/licenses/gpl.html>  
This is free software: you are free to change and redistribute it.  
There is NO WARRANTY, to the extent permitted by law.  
  
Attempt at preserving single version of GPG to encrypt and decrypt content no matter what happens with the GPG repository (no longer exists, no longer updated, no longer supported, etc).  
  
```txt

  // STRING ENCRYPT
  // 
  // Useful for storing passwords
  //
  // $ PAS=xyz; TXT=hello; echo $(echo $TXT | gpg --pinentry-mode=loopback --symmetric --passphrase $(echo $PAS) | base64 --wrap 0)
  // ... jA0ECQ...=n
  //
  // $ stre() { echo $2 | gpg --pinentry-mode=loopback --symmetric --passphrase $(echo $1) | base64 --wrap 0 && echo; }
  // $ stre 'xyz' 'hello'
  // 
  // STRING DECRYPT
  // 
  // Useful for storing passwords
  //
  // $ PAS=xyz; TXT='jA0ECQ...=n'; echo $TXT | base64 -d | gpg --pinentry-mode=loopback --passphrase $(echo $PAS) --decrypt --quiet
  // $ ... hello
  //
  // $ strd() { echo $2 | base64 -d | gpg --pinentry-mode=loopback --passphrase $(echo $1) --decrypt --quiet; }
  // $ strd 'xyz' 'jA0ECQ...=n'


  // USING SECRET KEY MANGLING
  // 
  // encrypt() {
  //   gpg --symmetric -z 9 --require-secmem --cipher-algo AES256 --s2k-cipher-algo AES256 --s2k-digest-algo SHA512 --s2k-mode 3 --s2k-count 65000000 --compress-algo BZIP2 $@
  // }
  // 
  // # note: will decrypt to STDOUT by default, for security reasons. remove "-d" or pipe to file to write to disk
  // decrypt() {
  //   gpg -d $@
  // }
  // 
  // # Encryption functions. Requires the GNUpg "gpg" commandline tool. On OS X, "brew install gnupg"
  // # Explanation of options here:
  // # ... --symmetric - Don't public-key encrypt, just symmetrically encrypt in-place with a passphrase.
  // # ... -z 9 - Compression level
  // # ... --require-secmem - Require use of secured memory for operations. Bails otherwise.
  // # ... cipher-algo, s2k-cipher-algo - The algorithm used for the secret key
  // # ... digest-algo - The algorithm used to mangle the secret key
  // # ... s2k-mode 3 - Enables multiple rounds of mangling to thwart brute-force attacks
  // # ... s2k-count 65000000 - Mangles the passphrase this number of times. Takes over a second on modern hardware.
  // # ... compress-algo BZIP2- Uses a high quality compression algorithm before encryption. BZIP2 is good but not compatible with PGP proper, FYI.


  // USING FILE
  // 
  // If you have gpg installed, this is an industrial-strength encryption method.
  // 
  // gpg --encrypt -r recipient@example.com >tempfile
  // 
  // Type data at the console and press Ctrl+D to end the text. This will give you encrypted data in tempfile. To decrypt:
  // 
  // gpg --decrypt <tempfile
  // 
  // You will need the passphrase for recipient@example.com to decrypt the message.

```

