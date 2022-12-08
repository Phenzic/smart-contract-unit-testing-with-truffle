const Sample = artifacts.require("Sample");
// const MetaCoin = artifacts.require("MetaCoin");

module.exports = function (deployer) {
  // deployer.deploy(Sample);
  // deployer.link(Sample, SampleTest);
  // deployer.deploy(SamplTest);
  deployer.deploy(Sample, { gas: 1000000 });
};
