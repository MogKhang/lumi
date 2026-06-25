// A focusable 2:3 poster tile. We render the artwork ourselves (a div with a
// background-image at the exact poster aspect) instead of using ImageItem, so
// the image fills the tile edge-to-edge with NO letterbox gutters and no
// meaningful crop. Spottable gives D-pad focus + a focus ring.

import Spottable from '@enact/spotlight/Spottable';
import ri from '@enact/ui/resolution';

const SpottableDiv = Spottable('div');

const PosterCard = ({src, caption, subCaption, width, height, onClick, onFocus, ...rest}) => {
	return (
		<SpottableDiv
			{...rest}
			role="button"
			onClick={onClick}
			onFocus={onFocus}
			className="lumi-poster"
			style={{width: ri.scaleToRem(width), flexShrink: 0, cursor: 'pointer'}}
		>
			<div
				className="lumi-poster-art"
				style={{
					width: ri.scaleToRem(width),
					height: ri.scaleToRem(height),
					backgroundImage: src ? `url("${src}")` : 'none',
					backgroundColor: '#1a1a1a',
					borderRadius: ri.scaleToRem(8)
				}}
			/>
			<div
				className="lumi-poster-caption"
				style={{
					width: ri.scaleToRem(width),
					marginTop: ri.scaleToRem(8),
					fontSize: ri.scaleToRem(42),
					lineHeight: 1.2,
					overflow: 'hidden',
					textOverflow: 'ellipsis',
					whiteSpace: 'nowrap'
				}}
			>
				{caption}
			</div>
			{subCaption ? (
				<div
					className="lumi-poster-subcaption"
					style={{
						width: ri.scaleToRem(width),
						fontSize: ri.scaleToRem(36),
						lineHeight: 1.2,
						opacity: 0.7,
						overflow: 'hidden',
						textOverflow: 'ellipsis',
						whiteSpace: 'nowrap'
					}}
				>
					{subCaption}
				</div>
			) : null}
		</SpottableDiv>
	);
};

export default PosterCard;
