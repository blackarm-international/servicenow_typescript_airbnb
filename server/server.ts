const getData = () => {
  const datacenters: Array<string> = [];
  let grDatacenter: any;
  // @ts-ignore
  grDatacenter = new GlideRecord('cmdb_ci_datacenter');
  grDatacenter.query();
  while (grDatacenter.next()) {
    datacenters.push(grDatacenter.getValue('name'));
  }
  datacenters.sort();
  // @ts-ignore
  data.datacenters = datacenters;
};
// @ts-ignore
if (input && input.getData) {
  // @ts-ignore
  getData();
}