if [[ :$PATH: == *:/usr/local/nodejs-binary-5.1.0/bin:* ]]; then
   echo '# O.K., the directory /usr/local/nodejs-binary-5.1.0/bin is on the path'
else
   echo 'export PATH=$PATH:/usr/local/nodejs-binary-5.1.0/bin'  >> ~/.bash_profile
   export PATH=$PATH:/usr/local/nodejs-binary-5.1.0/bin   
fi
