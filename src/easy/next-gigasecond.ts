const GIGASECOND: number = 1_000_000_000;
const DAY_SECONDS: number = 86_400;
const WEEK_SECONDS: number = 604_800;
const HOUR_SECONDS: number = 3_600;
const MINUTE_SECONDS: number = 60;
const MONTH_SECONDS: number = DAY_SECONDS * 30;
const YEAR_SECONDS: number = DAY_SECONDS * 365;

export const dateTimeObject = () => {
    const state = {
        seconds: GIGASECOND,
    };

    const years = Math.floor(state.seconds / YEAR_SECONDS);
    Object.assign(state, { years, seconds: state.seconds % YEAR_SECONDS });

    const months = Math.floor(state.seconds / MONTH_SECONDS);
    Object.assign(state, { months, seconds: state.seconds % MONTH_SECONDS });

    const days = Math.floor(state.seconds / DAY_SECONDS);
    Object.assign(state, { days, seconds: state.seconds % DAY_SECONDS });

    const hours = Math.floor(state.seconds / HOUR_SECONDS);
    Object.assign(state, { hours, seconds: state.seconds % HOUR_SECONDS });

    const minutes = Math.floor(state.seconds / MINUTE_SECONDS);
    Object.assign(state, { minutes, seconds: state.seconds % MINUTE_SECONDS });
    return state;
};
export const nextGigasecond = (start: Date): Date =>
    new Date(start.getTime() + GIGASECOND * 1000);
