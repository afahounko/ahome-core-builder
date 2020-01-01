#!/bin/bash

set +x

#ENTRYPOINT ["python3", "manage.py", "runserver", "0.0.0.0:8001"]

# Move to the source directory so we can bootstrap
if [ -f "/ahome_devel/manage.py" ]; then
    cd /ahome_devel
else
    echo "Failed to find awx source tree, map your development tree volume"
fi




make migrate
make fixtures
make node-install
make frontend-ui
# make collectstatic
# make init



# source /venv/ansible/bin/activate; \

# python3 manage.py runserver 0.0.0.0:8001

# exec $@


cd /ahome_devel
# Start the services
exec tini -- make supervisor