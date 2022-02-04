echo
# eslint
echo "checking client.ts with airbnb eslint"
if npx eslint client.ts
then
  echo "done"
else
  exit
fi
echo
echo "checking server.ts with airbnb eslint"
if npx eslint server.ts
then
  echo "done"
else
  exit
fi
echo
# transpile typescript
echo "transpiling client.ts and server.ts"
if tsc
then
  echo "done"
else
  exit
fi
echo
# make client code with servicenow weirdness
echo "making widget_client.js"
echo "api.controller = function() {" > widget_client.js
grep -Ev 'use strict|ts-ignore' < client.js | sed 's/    /  /g' | sed 's/^/  /' >> widget_client.js
echo "};" >> widget_client.js
echo "done"
echo
# make server code with servicenow weirdness
echo "making widget_server.js"
echo "(function () {" > widget_server.js
grep -Ev 'use strict|ts-ignore' < server.js | sed 's/    /  /g'  | sed 's/^/  /' >> widget_server.js
echo "})();" >> widget_server.js
echo "done"
echo