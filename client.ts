let serverLink: any = this;
const pageDraw = (datacenters: Array<string>) => {
  let outputDiv: HTMLElement | null;
  outputDiv = document.getElementById('output');
  if (outputDiv !== null) {
    outputDiv.innerText = JSON.stringify(datacenters, null, 2);
  }

};
const getDataFromServer = () => {
  let datacenters: Array<string> = [];
  serverLink.data.getData = true;
  serverLink.server.update().then(() => {
    serverLink.data.getData = false;
    datacenters = serverLink.data.datacenters;
    pageDraw(datacenters);
  });
};
getDataFromServer();