FROM mybusybox:v1

RUN touch /version.sh && \ 
	echo '#!/bin/sh' >> /version.sh && \ 
	echo 'echo "Version: 2.0"' >> /version.sh && \ 
	chmod +x /version.sh

ENTRYPOINT ["sh", "/version.sh"]