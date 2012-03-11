import java.util.*;

public class State {

    private String name;
    private List<Command> commands = new ArrayList<Command>();
    private Map<String, Transition> transitions = new HashMap<String, Transition>();

    public State(String name) {
        this.name = name;
    }

    public void addTransition(Event event, State targetState) {
        transitions.put(event.getCode(), new Transition(this, event, targetState));
    }

    public Collection<State> getAllTargets() {
        ArrayList<State> result = new ArrayList<State>();
        for (Transition transition : transitions.values()) {
            result.add(transition.getTarget());
        }
        return result;
    }

    public boolean hasTransition(String eventCode) {
        return transitions.keySet().contains(eventCode);
    }

    public State targetState(String eventCode) {
        return transitions.get(eventCode).getTarget();
    }

    public void executeActions(CommandsChannel commandsChannel) {
        for (Command command : commands) {
            commandsChannel.send(command.getCode());
        }
    }


    public void addAction(Command command) {
        commands.add(command);
    }
}
