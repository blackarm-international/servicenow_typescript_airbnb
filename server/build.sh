echo
# eslint
echo "checking server.ts with airbnb eslint"
if npx eslint server.ts
then
  echo "done"
else
  exit
fi
echo
# transpile typescript
echo "transpiling server.ts"
if tsc
then
  echo "done"
else
  exit
fi
echo
# make server code with servicenow weirdness
echo "making widget_server.js"
echo "(function () {" > ../widget_server.js
grep -Ev 'use strict|ts-ignore' < server.js | sed 's/    /  /g'  | sed 's/^/  /' >> ../widget_server.js
echo "})();" >> ../widget_server.js
echo "done"
echo