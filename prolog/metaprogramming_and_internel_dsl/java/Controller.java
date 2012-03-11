public class Controller {

    private State currentState;
    private StateMachine machine;
    private CommandsChannel commandsChannel;

    public CommandsChannel getCommandsChannel() {
        return commandsChannel;
    }

    public void handle(String eventCode) {
        if (currentState.hasTransition(eventCode)) {
            transitionTo(currentState.targetState(eventCode));
        }
    }

    private void transitionTo(State target) {
        currentState = target;
        currentState.executeActions(commandsChannel);
    }
}
