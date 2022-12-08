const Sample = artifacts.require("Sample");

contract("Sample", (accounts) => {
  describe("constructor", async function () {
    it("should have the correct name", async () => {
      const sample = await Sample.deployed();
      const name = await sample.name();
      assert.equal(name, "deployer");
    });

    it("should have the correct owner", async () => {
      const sample = await Sample.deployed();
      const owner = await sample.owner();
      assert.equal(owner, accounts[0]);
    });
  });

  describe("rename & describe", async function () {
    it("should be able to rename", async () => {
      const sample = await Sample.deployed();
      await sample.rename("new name");
      const name = await sample.describe();
      assert.equal(name, "new name");
    });
  });
  describe("changeOwner", async function () {
    it("should change the owner", async () => {
      const sample = await Sample.deployed();
      await sample.changeOwner(accounts[1], { from: accounts[0] });
      const owner = await sample.owner();
      assert.equal(owner, accounts[1]);
    });

    it("should not change the owner", async () => {
      const sample = await Sample.deployed();
      try {
        await sample.changeOwner(accounts[2], { from: accounts[1] });
      } catch (error) {
        assert.equal(
          error.message,
          "VM Exception while processing transaction: revert"
        );
      }
    });
  });
  describe("deposit", async function () {
    it("should allow deposits", async () => {
      const sample = await Sample.deployed();
      await sample.deposit({ value: 0.01 * 10 ** 18 });
    });
    it("should not allow deposits below 0.01 ETH", async () => {
      const sample = await Sample.deployed();
      try {
        await sample.deposit({ value: 0.009 * 10 ** 18 });
        assert.fail("deposit should have failed");
      } catch (error) {
        assert.ok(error.message.includes("revert"));
      }
    });
  });
  describe("withdraw", async function () {
    it("should allow withdrawals", async () => {
      const sample = await Sample.deployed();
      await sample.withdraw(BigInt(0.01 * 10 ** 18));
    });
    it("should not allow withdrawals above balance", async () => {
      const sample = await Sample.deployed();
      try {
        await sample.withdraw(BigInt(0.01 * 10 ** 18));
        assert.fail("withdrawal should have failed");
      } catch (error) {
        assert.ok(error.message.includes("revert"));
      }
    });
  });
});
