var workers = artifacts.require("\security_dev");



module.exports = function(deployer) {

  deployer.deploy(workers, {gas: 6700000});

};