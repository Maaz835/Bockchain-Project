pragma solidity 0.4.0;

contract StateTransV2 {
    enum Stage {Init, Reg, Vote, Done}
    Stage public stage;
    uint startTime;
    uint public timeNow;

    function StateTransV2() public {
        startTime = now;
        stage = Stage.Init;
    }

    function advanceState() public {
        timeNow = now;
        if (timeNow > (startTime + 10 seconds)) {
            startTime = timeNow;
            if (stage == Stage.Init) {
                stage = Stage.Reg;
                return;
            }
            if (stage == Stage.Reg) {
                stage = Stage.Vote;
                return;
            }
            if (stage == Stage.Vote) {
                stage = Stage.Done;
                return;
            }
        }
    }
}
