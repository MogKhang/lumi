// A horizontally-scrolling, Spotlight-navigable row of poster cards.
//
// A horizontal Scroller of custom PosterCard tiles (2:3, no gutters/crop). The
// hub title sits above; no underline (kept the title large like Android TV).
// With the app's full height chain in place, the outer vertical Scroller
// follows focus up/down between rows and each row scrolls left/right.

import {Scroller} from '@enact/limestone/Scroller';
import ri from '@enact/ui/resolution';

import PosterCard from './PosterCard';

// 2:3 poster.
export const POSTER_W = 400;
export const POSTER_H = 600;
const CAPTION_H = 160;
// Space above the row's posters so the focus ring never touches the title.
const ROW_TOP_PAD = 12;
// Hub title font size.
const TITLE_SIZE = 60;

function caption(item) {
	if (item.type === 'episode') return item.grandparentTitle || item.title;
	return item.title;
}

// Year for the line under the title. Prefer the explicit year; fall back to the
// year portion of Plex's originallyAvailableAt (YYYY-MM-DD). Episodes show the
// show's air year too (year is usually present on episodes from hubs).
function yearOf(item) {
	if (item.year) return String(item.year);
	if (item.originallyAvailableAt) return String(item.originallyAvailableAt).slice(0, 4);
	return '';
}

function subCaption(item) {
	return yearOf(item);
}

const MediaRow = ({title, items, imageFor, onSelect, onRowFocus}) => {
	if (!items || items.length === 0) return null;

	return (
		<div style={{marginBottom: ri.scaleToRem(56)}}>
			{/* Hub title (previous working size), no underline. */}
			<div
				style={{
					fontSize: ri.scaleToRem(TITLE_SIZE),
					fontWeight: 600,
					padding: `0 ${ri.scaleToRem(12)} ${ri.scaleToRem(8)}`
				}}
			>
				{title}
			</div>
			<Scroller
				direction="horizontal"
				horizontalScrollbar="hidden"
				verticalScrollbar="hidden"
				style={{height: ri.scaleToRem(POSTER_H + CAPTION_H + ROW_TOP_PAD)}}
			>
				<div
					style={{
						display: 'flex',
						gap: ri.scaleToRem(24),
						padding: `${ri.scaleToRem(ROW_TOP_PAD)} ${ri.scaleToRem(12)} 0`
					}}
				>
					{items.map((item) => (
						<PosterCard
							key={item.id}
							src={imageFor(item)}
							caption={caption(item)}
							subCaption={subCaption(item)}
							width={POSTER_W}
							height={POSTER_H}
							onClick={() => onSelect(item)}
							onFocus={onRowFocus}
						/>
					))}
				</div>
			</Scroller>
		</div>
	);
};

export default MediaRow;
