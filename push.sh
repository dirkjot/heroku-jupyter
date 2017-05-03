

echo "Starting Jupyter notebook on PEZ"
echo ""
echo "NOTE: this is currently not secured"
echo ""
echo "Please enter your postgres database credentials:"
cf cups jupyter-db -p "username, password, uri"

# if you always use the same credentials, use this:
# cf cups jupyter-db -p '{"username": "postgres", "password": "password", "uri": "postgres://postgres:password@10.0.22.60:30001/postgres"}'`

echo "Pushing app to PEZ"
cf push --no-start
cf bind-service jupyter jupyter-db
echo "Disabling security on Notebook"
cf set-env jupyter JUPYTER_NOTEBOOK_PASSWORD_DISABLED DangerZone!
cf scale jupyter -k 2G -f
echo "Starting notebook server"
cf start jupyter

echo ""
echo "Your notebook is up and can be reached at this address:"
echo "NOTE: you must use HTTP:// not HTTPS://"
cf apps | grep jupyter
