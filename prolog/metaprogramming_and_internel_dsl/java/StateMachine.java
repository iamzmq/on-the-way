import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class StateMachine {

    private State start;
    private State state;
    private List<Event> resetEvents = new ArrayList<Event>();

    public StateMachine(State state) {
        this.state = state;
    }

    public Collection<State> getStates() {
        List<State> result = new ArrayList<State>();
        collectStates(result, start);
        return result;
    }

    private void collectStates(List<State> result, State start) {
        if (result.contains(state)) return;
        result.add(state);
        for (State next : state.getAllTargets()) {
            collectStates(result, next);
        }
    }

    public void addResetEvents(Event... events) {
        for (Event event : events) {
            resetEvents.add(event);
        }
    }

    public boolean isResetEvent(String eventCode) {
        return resetEventCodes().contains(eventCode);
    }

    private List<String> resetEventCodes() {
        ArrayList<String> result = new ArrayList<String>();
        for (Event e : resetEvents) {
            result.add(e.getCode());
        }
        return result;
    }
}
