export const backgroundTypes = ["none", "circle", "square"] as const;

export type BackgroundType = typeof backgroundTypes[number];
