export const logoSizes = ["big", "small"] as const;

export type LogoSize = typeof logoSizes[number];
