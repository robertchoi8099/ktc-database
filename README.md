ktc-database Cookbook
=====================
This is an application / role cookbook for stackforge os-ops-database cookbook


Attributes
----------
["openstack"]["db"]["service_type"]


e.g.
#### ktc-database::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>["openstack"]["db"]["service_type"]</tt></td>
    <td>String</td>
    <td>Database to use</td>
    <td><tt>mysql</tt></td>
  </tr>
</table>

Usage
-----
#### ktc-database::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `ktc-database` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[ktc-database]"
  ]
}
```

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: TODO: List authors
